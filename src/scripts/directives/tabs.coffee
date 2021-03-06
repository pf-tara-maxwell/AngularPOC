angular.module('app').directive 'appTabs', ['$log', ($log) ->
	controller = ['$scope', '$element', '$rootScope', ($scope, $element, $rootScope) ->
		$scope.tabs = []

		$scope.select = (tab) ->
			return if tab.selected is true

			angular.forEach $scope.tabs, (tab) ->
				tab.selected = false

			tab.selected = true

		@addTab = (tab, tabId) ->
			$scope.select tab if $scope.tabs.length is 0
			$scope.tabs.push tab

			if tabId
				$rootScope.$on "changeTab##{tabId}", ->
					$scope.select tab
	]

	controller: controller
	replace: true
	restrict: 'E'
	scope: {}
	templateUrl: '/views/directives/tabs.html'
	transclude: true
]