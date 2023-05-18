User.create(first_names: "Daniel Admin", last_names: "Campos", email: "daniel.camposp@campusucc.edu.co", phone: "3058193746", password: "12345678", status: "active", singed: nil, role: 0)
User.create(first_names: "Daniel Aux", last_names: "Campos", email: "daniel.aux@campusucc.edu.co", phone: "3058193746", password: "12345678", status: "active", singed: nil, role: 1)
User.create(first_names: "Daniel Estudiante", last_names: "Campos", email: "daniel.student@campusucc.edu.co", phone: "3058193746", password: "12345678", status: "active", singed: nil, role: 2)
User.create(first_names: "Daniel Profesor", last_names: "Campos", email: "daniel.teacher@campusucc.edu.co", phone: "3058193746", password: "12345678", status: "active", singed: nil, role: 3)
User.create(first_names: "Visitante", last_names: "", email: "", phone: "", password: "visitante@campusucc.edu.co", status: "active", singed: nil, role: 4)

Tool.create(name: "Router 0001", tool_type: 0)
Tool.create(name: "Router 0002", tool_type: 0)
Tool.create(name: "Router 0003", tool_type: 0)

Tool.create(name: "Bloque 1 - Sala 102", tool_type: 1)
Tool.create(name: "Bloque 15 - Sala 1501", tool_type: 1)
Tool.create(name: "Bloque 8 - Sala 802", tool_type: 1)

Reservation.create(reservation_date: Time.now, range: 1, user_id: 3, tool_id: 1)
Reservation.create(reservation_date: Time.now, range: 1, user_id: 3, tool_id: 2)
Reservation.create(reservation_date: Time.now, range: 1, user_id: 3, tool_id: 3)
Reservation.create(reservation_date: Time.now, range: 1, user_id: 3, tool_id: 4)
Reservation.create(reservation_date: Time.now, range: 1, user_id: 3, tool_id: 5)
Reservation.create(reservation_date: Time.now, range: 1, user_id: 3, tool_id: 6)

Donation.create(tool_name: 'Cable de red 2m', status: 0, user_id: 3)
Donation.create(tool_name: 'Cable de red 3m', status: 0, user_id: 3)
