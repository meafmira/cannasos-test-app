class AdvicesSingle
  constructor: (Advice, $stateParams) ->
    Advice.get($stateParams.adviceId).then (advice) =>
      @advice = advice

AdvicesSingle.$inject = [ 'Advice', '$stateParams' ]

module.exports = AdvicesSingle
