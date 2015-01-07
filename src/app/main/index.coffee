adviceService = require "../../components/advice.service"
advicesController = require "./advices.controller"
localStorageService = require "../../components/local_storage.service"
strainService = require "../../components/strain.service"
advicesSingleController = require "./advices_single.controller"

module.exports = angular.module "cannasos.main", []
.config ($stateProvider) ->
  $stateProvider
    .state "advices",
      url: "/advices",
      templateUrl: "app/main/main.html"
      controller: "AdvicesCtrl as advices"

    .state "advices-single",
      url: "/advices/:adviceId"
      templateUrl: "app/main/advices_single.html"
      controller: "AdvicesSingleCtrl as advicesSingle"

.factory "Advice", adviceService
.factory "LocalStorage", localStorageService
.factory "Strain", strainService
.controller "AdvicesCtrl", advicesController
.controller "AdvicesSingleCtrl", advicesSingleController
