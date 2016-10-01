ModelsController = ($scope, $state, Restangular, $stateParams) ->
  $scope.store = Restangular.all('models')

  Restangular.all('users').customGET('kms_user').then (current_user) ->
    $scope.currentUser = current_user
    $scope.currentUser.admin = $scope.currentUser.role == 'admin'

  $scope.store.getList().then (models)->
    $scope.models = models

  if $stateParams.id
    $scope.store.get($stateParams.id).then (model)->
      $scope.model = model
  else
    $scope.model = {fields: []}

  $scope.$watchCollection 'model.fields', (newFields, oldFields) ->
    if newFields and newFields.length > 0 and oldFields and oldFields.length == 0
      $scope.model.label_field =newFields[0].liquor_name

  $scope.create = ->
    $scope.store.post($scope.model).then ->
      # for adding to Menu - better to render resources via js
      window.location.reload()
      #$state.go('models')
    ,->
      console.log('bug')

  $scope.update = ->
    $scope.model.put().then ->
      $state.go('models')
    ,->
      console.log('bug')

  $scope.destroy = (model)->
    if confirm('Вы уверены?')
      model.remove().then ->
        window.location.reload()


angular.module('KMS')
    .controller('ModelsController', ['$scope', '$state', 'Restangular', '$stateParams', ModelsController])
