(define (problem hospital-shared-room)
  (:domain hospital-room-assignment)
  
  (:objects
    patient1 patient2 - patient
    room1 room2 room3 - room
    ventilator - equipment
  )
  
  (:init
    
    (patient-assigned patient1 room1)
    (patient-needs-equipment patient1 ventilator)
    (equipment-assigned ventilator patient1 room1)
    
    (patient-assigned patient2 room2)
  
    (room-has-equipment room1 ventilator)
    (room-has-equipment room3 ventilator)
  )
  
  (:goal
    (and
      (patient-assigned patient1 room3)
      (patient-assigned patient2 room3)
      (equipment-assigned ventilator patient1 room3)
    )
  )
)
