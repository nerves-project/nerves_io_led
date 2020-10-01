use Mix.Config

# uses a special callback form for an led that can be used to define special
# behavior for testing rather than using sys/class/leds

config :nerves_leds,
  names: [
    test_led: &Nerves.Leds.Test.on_led_write/1
  ]

# redefine led state map to be default, but with an additional custom
# state to handle test_states

config :nerves_leds,
  states: [
    true: [brightness: 1],
    false: [brightness: 0],
    slowblink: [trigger: "timer", delay_off: 250, delay_on: 250],
    fastblink: [trigger: "timer", delay_off: 80, delay_on: 50],
    slowwink: [trigger: "timer", delay_on: 1000, delay_off: 100],
    heartbeat: [trigger: "heartbeat"],
    test_state: [foo: 3, bar: 29, baz: %{}]
  ]
