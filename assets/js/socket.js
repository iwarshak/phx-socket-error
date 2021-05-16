// NOTE: The contents of this file will only be executed if
// you uncomment its entry in "assets/js/app.js".

// To use Phoenix channels, the first step is to import Socket,
// and connect at the socket path in "lib/web/endpoint.ex".
//
// Pass the token on params as below. Or remove it
// from the params if you are not using authentication.
import {Socket} from "phoenix"

let socket = new Socket("/socket", {params: {token: window.userToken}})
socket.onOpen(() => console.log("socket onOpen"))
socket.onClose(() => console.log("socket onClose"))
socket.onError((e) => console.log("socket onError", e, this))
socket.connect()

// Now that you are connected, you can join channels with a topic:
let channel = socket.channel("main", {})
channel.onClose(() => console.log("channel onClose"))
channel.onError((e) => console.log("channel onError", e))
channel.join()
  .receive("ok", resp => { console.log("channel joined successfully", resp) })
  .receive("error", resp => { console.log("Unable to join", resp) })

export default socket
