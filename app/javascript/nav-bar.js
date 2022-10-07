window.addEventListener('load', function() {
  const navItems = document.querySelectorAll(".nav-item");

  navItems.forEach(function(item) {
    item.addEventListener('mouseover', function() {
      this.setAttribute("style",
        "background-color: #161D6F; color: #F6F6F6; transition: all, 0.5s;"
      )
    })
    item.addEventListener('mouseout', function() {
      this.removeAttribute("style",
        "background-color: #161D6F; color: #F6F6F6; transition: all, 0.5s;"
      )
    })
  })
})