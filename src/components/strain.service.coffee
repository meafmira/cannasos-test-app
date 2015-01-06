module.exports = ['Restangular', 'LocalStorage', '$q', (Restangular, LocalStorage, $q) ->
  rest = Restangular.all 'strains'
  new class Strain
    get: (id, fields = [ '_id', 'category', 'title' ]) ->
      if LocalStorage.isEmpty("strain#{id}")
        rest.get(id, { fields: fields.join(',') }).then (strain) ->
          LocalStorage.set "strain#{id}", strain
          strain
      else
        $q.when(LocalStorage.get("strain#{id}"))
]
