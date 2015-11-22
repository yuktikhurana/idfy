function SearchAndFilter(searchableElements, searchBox, veganButton) {
  var that = this;
  this.searchableElements = searchableElements;
  this.searchBox = searchBox;
  this.veganButton = veganButton;

  this.init = function() {
    this.bindEvents();
  };

  this.bindEvents = function() {
    this.veganButton.on('click', this.showRelevantElements);
    this.searchBox.on('keypress', function(e) {
      if (e.keyCode == 13) {
        that.showRelevantElements(e);
      }
    });
  };

  this.showRelevantElements = function(e) {
    var target = $(this);
    var elements = that.searchableElements;
    that.searchableElements.hide();
    if (target.attr('id') == that.veganButton.attr('id')) {
      that.veganButton.toggleClass('vegan');
    }
    elements = that.searchElements(elements);
    elements = that.filterVegans(elements);
    elements.show();
  };

  this.filterVegans = function(elements) {
    var vegan = this.veganButton.hasClass('vegan');
    if (vegan) {
      this.veganButton.addClass('btn-success').removeClass('btn-danger');
    } else {
      this.veganButton.addClass('btn-danger').removeClass('btn-success');
    }
    return elements.filter(function(){
      return $(this).find("[data-vegan='" + vegan +"']").length > 0
    });
  };

  this.searchElements = function(elements) {
    var searchBoxText = this.searchBox.val().toLowerCase();
    if(searchBoxText) {
      return elements.filter(function(){
        return $(this).find('[data-status="' + searchBoxText + '"], [data-height="' + searchBoxText + '"], [data-ethnicity="' + searchBoxText + '"]').length > 0
      });
    } else {
      return elements;
    }
  };
}

$(document).ready(function() {
  var memberSearchAndFilter = new SearchAndFilter($('.member'), $('#search_members') , $('#toggle_vegan'));
  memberSearchAndFilter.init()
})