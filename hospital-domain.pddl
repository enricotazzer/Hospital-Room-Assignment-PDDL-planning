(define (domain hospital-room-assignment)
  (:requirements :strips :typing)
  
  (:types 
    patient room equipment - object
  )
  
  (:predicates
    (patient-assigned ?p - patient ?r - room)
    (patient-needs-equipment ?p - patient ?e - equipment)
    (room-has-equipment ?r - room ?e - equipment)
    (equipment-assigned ?e - equipment ?p - patient ?r - room)
  )
  
  ;; Assign/Unassign actions - Patients WITHOUT equipment needs
  
  (:action assign-patient
    :parameters (?p - patient ?r - room)
    :precondition (and 
      (not (patient-assigned ?p ?r))
    )
    :effect (and 
      (patient-assigned ?p ?r)
    )
  )
  
  (:action unassign-patient
    :parameters (?p - patient ?r - room)
    :precondition (and 
      (patient-assigned ?p ?r)
    )
    :effect (and 
      (not (patient-assigned ?p ?r))
    )
  )
  
  ;; Assign/Unassign actions - Patients WITH equipment needs
  (:action assign-patient-with-equipment
    :parameters (?p - patient ?r - room ?e - equipment)
    :precondition (and 
      (not (patient-assigned ?p ?r))
      (patient-needs-equipment ?p ?e)
      (room-has-equipment ?r ?e)
      (not (equipment-assigned ?e ?p ?r))
    )
    :effect (and 
      (patient-assigned ?p ?r)
      (equipment-assigned ?e ?p ?r)
    )
  )
  
  (:action unassign-patient-with-equipment
    :parameters (?p - patient ?r - room ?e - equipment)
    :precondition (and 
      (patient-assigned ?p ?r)
      (patient-needs-equipment ?p ?e)
      (room-has-equipment ?r ?e)
      (equipment-assigned ?e ?p ?r)
    )
    :effect (and 
      (not (patient-assigned ?p ?r))
      (not (equipment-assigned ?e ?p ?r))
    )
  )
  
  ;; Move/Move reverse actions - patients without equipment needs 
  (:action move-patient
    :parameters (?p - patient ?from - room ?to - room)
    :precondition (and 
      (patient-assigned ?p ?from)
      (not (patient-assigned ?p ?to))
    )
    :effect (and 
      (not (patient-assigned ?p ?from))
      (patient-assigned ?p ?to)
    )
  )
  
  (:action move-patient-reverse
    :parameters (?p - patient ?from - room ?to - room)
    :precondition (and 
      (patient-assigned ?p ?to)
      (not (patient-assigned ?p ?from))
    )
    :effect (and 
      (not (patient-assigned ?p ?to))
      (patient-assigned ?p ?from)
    )
  )
  
  ;; Move/Move reverse actions - patients with equipment needs
  (:action move-patient-with-equipment
    :parameters (?p - patient ?from - room ?to - room ?e - equipment)
    :precondition (and 
      (patient-assigned ?p ?from)
      (not (patient-assigned ?p ?to))
      (patient-needs-equipment ?p ?e)
      (equipment-assigned ?e ?p ?from)
      (not (equipment-assigned ?e ?p ?to))
      (room-has-equipment ?from ?e)
      (room-has-equipment ?to ?e)
    )
    :effect (and 
      (not (patient-assigned ?p ?from))
      (not (equipment-assigned ?e ?p ?from))
      (patient-assigned ?p ?to)
      (equipment-assigned ?e ?p ?to)
    )
  )
  
  (:action move-patient-with-equipment-reverse
    :parameters (?p - patient ?from - room ?to - room ?e - equipment)
    :precondition (and 
      (patient-assigned ?p ?to)
      (not (patient-assigned ?p ?from))
      (patient-needs-equipment ?p ?e)
      (equipment-assigned ?e ?p ?to)
      (not (equipment-assigned ?e ?p ?from))
      (room-has-equipment ?from ?e)
      (room-has-equipment ?to ?e)
    )
    :effect (and 
      (not (patient-assigned ?p ?to))
      (not (equipment-assigned ?e ?p ?to))
      (patient-assigned ?p ?from)
      (equipment-assigned ?e ?p ?from)
    )
  )
)
