//change uml university student
//relation of student contact intenrship offer is not ok
sig University {
    has: set Student
}

sig Student {
    has: one ProfessionalProfile,
    uploads: one CV,
    contacts: set InternshipOffer // Students can contact multiple internship offers
}

sig ProfessionalProfile {}
sig CV {}

sig Company {
    posts: set InternshipOffer // The internship offers posted by the company
}

sig InternshipOffer {
    involves: set SelectionProcess,  // Some internship offers involve one or more selection processes
    postedBy: one Company            // The company that posted this internship offer
}

sig Questionnaire {} {
    // Every Questionnaire must be used by a SelectionProcess
    one sp: SelectionProcess | this = sp.usesQuestionnaire
}

sig Template {} {
    one sp: SelectionProcess | this = sp.usesTemplate
}

sig Interview {} {
    // Every Interview must be used by a SelectionProcess
    one sp: SelectionProcess | this = sp.usesInterview
}

sig SelectionProcess {
    participant: one Student,           // The student participating in the selection process
    usesQuestionnaire: lone Questionnaire, // Optionally uses a questionnaire
    usesInterview: lone Interview,      // Optionally uses an interview
    usesTemplate: lone Template,        // Optionally uses a template
   var status: one Status  
} {
    // This SelectionProcess must be associated with exactly one InternshipOffer
    one io: InternshipOffer | this in io.involves and io in participant.contacts
}

sig Internship {
    offeredBy: one Company,             // The company offering the internship
    isPreceded: one SelectionProcess    // The selection process that precedes the internship
} {
    // The company offering the internship must be the one that posted the associated internship offer
  one io: InternshipOffer | isPreceded in io.involves and (offeredBy = io.postedBy)
isPreceded.status = Accepted
}
abstract sig Status {} // Abstract signature for status
one sig Accepted, Pending, Rejected extends Status {} // Concrete statuses


fact UniqueStudentUniversity {
    all s: Student | one u: University | s in u.has
}

fact OfferMadeByCompany {
    // All InternshipOffers posted by a Company must have the Company in postedBy
    all c: Company | all io: c.posts | io.postedBy = c
}

fact oneProfessionalProfile {
    all p: ProfessionalProfile | one s: Student | s.has = p
}

fact oneCV {
    all cv: CV | one s: Student | s.uploads = cv
}

fact StudentsContactOffers {
    // Ensure that students can only contact offers posted by companies
    all s: Student | s.contacts in Company.posts
}

fact UniqueSelectionProcess {
    // Ensure that no two different InternshipOffers share the same SelectionProcess
    all sp: SelectionProcess | 
        lone io: InternshipOffer | sp in io.involves
}

fact NoDuplicateParticipants {
    // Ensure that SelectionProcesses from the same InternshipOffer do not share the same participant
    all io: InternshipOffer | 
        all sp1, sp2: io.involves | 
            sp1 != sp2 => sp1.participant != sp2.participant
}
fact PendingOrRejectedNotLinkedToInternship {
    // Ensure that pending or rejected selection processes are not related to an internship
    all sp: SelectionProcess | sp.status in (Pending + Rejected) => no i: Internship | i.isPreceded = sp
}
fact RejectedRemainsRejected {
    // If a selection process is rejected, it will always remain rejected
    all sp: SelectionProcess | always (sp.status = Rejected =>  always sp.status = Rejected)
}
fact AcceptedRemainAccepted {
    // If a selection process is rejected, it will always remain rejected
    all sp: SelectionProcess | always (sp.status = Accepted =>  always sp.status = Accepted)
}

fact PendingTransitions {
    // If a selection process is pending, it will eventually transition to accepted or rejected
    all sp: SelectionProcess | 
        sp.status = Pending => eventually (sp.status = Accepted or sp.status = Rejected)
}

fact InternshipAppearsWithAccepted {
    // Ensure that when a SelectionProcess transitions to Accepted, an Internship is linked
    all sp: SelectionProcess | 
        sp.status = Accepted => some i: Internship | i.isPreceded = sp
}

fact EventuallyAccepted {
    // If an InternshipOffer has two or more selection processes, eventually one or more must be `accepted`
    all io: InternshipOffer | 
        #io.involves >= 2 => 
        some sp: io.involves | eventually sp.status = Accepted
}

pred show {
    some io: InternshipOffer | #io.involves >= 2 and
	one Internship
}

run show

