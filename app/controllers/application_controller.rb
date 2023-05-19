class ApplicationController < ActionController::Base
  add_flash_types :info, :error, :warning, :success
  helper_method :current_user, :modules_by_user

  def current_user
    User.find_by(id: session[:user_id])
  end

  def modules_by_user
    options = {
      # enum role: %i[administrator aux student teacher visitor]
      'administrator' => -> () {
        [
          {
            'Gestion usuarios' => [
              { text: 'Listar Usuarios', path: users_path, icon: 'tasks'},
              { text: 'Crear Usuarios', path: new_user_path, icon: 'plus'}
            ]
          },
          {
            'Dispositivos/Salas' => [
              { text: 'Listar Dispositivos', path: tools_path, icon: 'tasks'},
              { text: 'Crear Dispositivos', path: new_tool_path, icon: 'plus'}
            ]
          },
          {
            'Reservaciones' => [
              { text: 'Listar Reservas', path: reservations_path, icon: 'tasks'},
              { text: 'Agendar reserva', path: new_reservation_path, icon: 'plus'},
              { text: 'Consultar Agenda', path: calendar_path, icon: 'calendar'}
            ]
          },
          {
            'Donaciones' => [
              { text: 'Listar Donaciones', path: donations_path, icon: 'tasks'},
              { text: 'Donar Dispositivo', path: new_donation_path, icon: 'plus'}
            ]
          },
        ]
      },

      'aux' => -> () {
        [
          {
            'Dispositivos/Salas' => [
              { text: 'Listar Dispositivos', path: tools_path, icon: 'tasks'},
              { text: 'Crear Dispositivos', path: new_tool_path, icon: 'plus'}
            ]
          },
          {
            'Reservaciones' => [
              { text: 'Listar Reservas', path: reservations_path, icon: 'tasks'},
              { text: 'Agendar reserva', path: new_reservation_path, icon: 'plus'},
              { text: 'Consultar Agenda', path: calendar_path, icon: 'calendar'}
            ]
          },
        ]
      },

      # enum role: %i[administrator aux student teacher visitor]
      'student' => -> () {
        [
          {
            'Dispositivos/Salas' => [
              { text: 'Listar Dispositivos', path: tools_path, icon: 'tasks'}
            ]
          },
          {
            'Reservaciones' => [
              { text: 'Listar Reservas', path: reservations_path, icon: 'tasks'},
              { text: 'Agendar reserva', path: new_reservation_path, icon: 'plus'},
              { text: 'Consultar Agenda', path: calendar_path, icon: 'calendar'}
            ]
          },
          {
            'Donaciones' => [
              { text: 'Donar Dispositivo', path: new_donation_path, icon: 'plus'}
            ]
          },
        ]
      },

      # enum role: %i[administrator aux student teacher visitor]
      'teacher' => -> () {
        [
          {
            'Dispositivos/Salas' => [
              { text: 'Listar Dispositivos', path: tools_path, icon: 'tasks'}
            ]
          },
          {
            'Reservaciones' => [
              { text: 'Listar Reservas', path: reservations_path, icon: 'tasks'},
              { text: 'Agendar reserva', path: new_reservation_path, icon: 'plus'},
              { text: 'Consultar Agenda', path: calendar_path, icon: 'calendar'}
            ]
          },
          {
            'Donaciones' => [
              { text: 'Donar Dispositivo', path: new_donation_path, icon: 'plus'}
            ]
          },
        ]
      },

      # enum role: %i[administrator aux student teacher visitor]
      'visitor' => -> () {
        [
          {
            'Dispositivos/Salas' => [
              { text: 'Listar Dispositivos', path: tools_path, icon: 'tasks'}
            ]
          },
          {
            'Reservaciones' => [
              { text: 'Listar Reservas', path: reservations_path, icon: 'tasks'},
              { text: 'Agendar reserva', path: new_reservation_path, icon: 'plus'},
              { text: 'Consultar Agenda', path: calendar_path, icon: 'calendar'}
            ]
          },
          {
            'Donaciones' => [
              { text: 'Donar Dispositivo', path: new_donation_path, icon: 'plus'}
            ]
          },
        ]
      },

    }

    options[current_user.role].()
  end
end
