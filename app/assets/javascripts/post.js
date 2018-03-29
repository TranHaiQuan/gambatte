var app = angular.module('gambatte', []);
app.controller('PostCtrl', function($scope) {
    $scope.name = "John Doe";
});
var posts = new Post({
    datumTokenizer: Post.tokenizers.whitespace,
    queryTokenizer: Post.tokenizers.whitespace,
    remote: {
      url: '/posts/autocomplete?query=%QUERY',
      wildcard: '%QUERY'
    }
  });
  $('#posts_search').typeahead(null, {
    source: posts
  });