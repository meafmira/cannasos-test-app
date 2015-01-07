class Advices
  constructor: (@Advice) ->
    @currentPage = 1
    @Advice.getList().then (advices) =>
      @advices = advices

  loadMore: ->
    @currentPage++
    @Advice.getList(null, @currentPage).then (newAdvices) =>
      @advices = @advices.concat newAdvices

Advices.$inject = [ 'Advice' ]

module.exports = Advices
