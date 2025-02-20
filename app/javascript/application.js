// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"

// Configure Turbo to handle Devise's sign out
document.addEventListener("turbo:before-fetch-request", (e) => {
  if (e.detail.fetchOptions.method === "DELETE") {
    e.detail.fetchOptions.headers["Accept"] = "text/html,application/xhtml+xml"
  }
})

// Disable Turbo on sign out button and handle page load
document.addEventListener("turbo:load", () => {
  // Handle sign out button
  const signOutButton = document.querySelector('form[action="/users/sign_out"]')
  if (signOutButton) {
    signOutButton.setAttribute("data-turbo", "false")
  }

  // Handle page load
  window.scrollTo(0, 0)
  document.body.style.overflowY = "auto"
})
