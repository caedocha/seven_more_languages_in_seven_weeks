defmodule VideoStore.Concrete do import StateMachine.Behavior
  def rent(video), do: fire(state_machine, video, :rent)
  def return(video), do: fire(state_machine, video, :return)
  def lose(video), do: fire(state_machine, video, :lose)
  def find(video), do: fire(state_machine, video, :find)

  def before_rent() do
    IO.puts "---- CALLING RENT BEFORE HOOK"
  end

  def after_rent() do
    IO.puts "++++ CALLING RENT AFTER HOOK"
  end

  def after_find() do
    IO.puts "**** CALLING FIND AFTER HOOK"
  end

  def state_machine do
    [
      available: [
        rent: [ to: :rented, calls: [&VideoStore.renting/1]]
      ],
      rented: [
        return: [ to: :available, calls: [&VideoStore.returning/1]],
        lose: [ to: :lost, calls: [&VideoStore.losing/1]]
      ],
      lost: [
        find: [ to: :found, calls: [&VideoStore.finding/1]]
      ],
      found: []
    ]
  end
end
