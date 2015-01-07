module.exports = ['Restangular', 'Strain', (Restangular, Strain) ->
  rest = Restangular.all 'advices'
  new class Advices
    getList: (fields = ['title', 'strain.title', 'strain._id'], page = 1, perPage = 10) ->
      rest.getList(page: page, perPage: perPage, fields: fields.join(',')).then (advices) =>
        @_unifyAdvices advices

    get: (id) -> rest.get(id).then (advice) =>
      unifiedAdvices = @_unifyAdvices [advice]
      unifiedAdvices[0]

    _unifyAdvices: (advices) ->
      advices.map (advice) ->
        if advice.strain?
          Strain.get(advice.strain._id).then (strain) ->
            advice.strain = strain

        advice
]
