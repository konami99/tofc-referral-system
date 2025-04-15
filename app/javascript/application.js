import { Application } from "@hotwired/stimulus"
import ClipboardController from "./controllers/clipboard_controller"
import HelloController from "./controllers/hello_controller"

const application = Application.start()

application.register("clipboard", ClipboardController)
application.register("hello", HelloController)

// Configure Stimulus development experience
application.debug = false
window.Stimulus   = application

export { application }