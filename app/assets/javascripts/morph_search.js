var ready;
ready = function() {
  var morphSearch = document.getElementById("morphsearch"),
    input = morphSearch.querySelector("input.morphsearch-input"),
    ctrlClose = morphSearch.querySelector("span.morphsearch-close"),
    isOpen = (isAnimating = false),
    // show/hide search area
    toggleSearch = function(evt) {
      // return if open and the input gets focused
      if (evt.type.toLowerCase() === "focus" && isOpen) return false;

      var offsets = morphsearch.getBoundingClientRect();
      if (isOpen) {
        classie.remove(morphSearch, "open");

        // trick to hide input text once the search overlay closes
        // todo: hardcoded times, should be done after transition ends
        if (input.value !== "") {
          setTimeout(function() {
            classie.add(morphSearch, "hideInput");
            setTimeout(function() {
              classie.remove(morphSearch, "hideInput");
              input.value = "";
            }, 300);
          }, 500);
        }

        input.blur();
      } else {
        classie.add(morphSearch, "open");
      }
      isOpen = !isOpen;
    };

  // events
  input.addEventListener("focus", toggleSearch);
  ctrlClose.addEventListener("click", toggleSearch);
  // esc key closes search overlay
  // keyboard navigation events
  document.addEventListener("keydown", function(ev) {
    var keyCode = ev.keyCode || ev.which;
    if (keyCode === 27 && isOpen) {
      toggleSearch(ev);
    }
  });

  /***** for demo purposes only: don't allow to submit the form *****/
  morphSearch
    .querySelector('button[type="submit"]')
    .addEventListener("click", function(ev) {
      // ev.preventDefault();
    });

  $target = $("input.morphsearch-input");

  $target.on("input", function() {
    $.ajax({
      url: "/search/for",
      type: "get",
      data: {
        term: $target.val()
      },
      dataType: "json",
      success: function(data) {
        // clear the search area
        purge_search_area(1);

        // update the search results
        $.each(data.data, function(i, searchItem) {
          let result = "<a class='dummy-media-object' href='";
          result += "http://roshetta.com/drugs/";
          result += searchItem.id;
          result += "'> <img src=''></img><h3>";
          result += searchItem.name.toUpperCase();
          result += "</h3></a>";
          $(result).appendTo($searchItems);
        });
      },
      error: function() {}
    });
  });
};

function purge_search_area(code){
  // update the views here
  //  get the search content div
  let $searchContent = $(".morphsearch-content");
  // get the drugs search results column
  let $searchItems = $searchContent
    .children(
      ".dummy-column"
    )
    .eq(code);
  $searchItems.html("");
}

$(document).ready(ready);
$(document).on("page:load", ready);
$(document).on("page:change", ready);
