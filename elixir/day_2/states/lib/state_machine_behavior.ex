defmodule StateMachine.Behavior do

  def fire(context, event) do
    %{context | state: event[:to]}
    |> activate(event)
  end

  def fire(states, context, event_name) do
    call_before_hook(event_name)
    event = states[context.state][event_name]
    result = fire(context, event)
    call_after_hook(event_name)
    result
  end

  def activate(context, event) do
    Enum.reduce(event[:calls] || [], context, &(&1.(&2)))
  end

  def call_before_hook(event_name) do
    event_name |> to_before_hook |> call_hook
  end

  def call_after_hook(event_name) do
    event_name |> to_after_hook |> call_hook
  end

  def call_hook(hook) do
    if (hook |> hook_defined?) do
      apply(VideoStore.Concrete, hook, [])
    end
  end

  def hook_defined?(hook) do
    function_exported?(VideoStore.Concrete, hook, 0)
  end

  def to_before_hook(event_name) do
    String.to_atom("before_#{event_name}")
  end

  def to_after_hook(event_name) do
    String.to_atom("after_#{event_name}")
  end

end
