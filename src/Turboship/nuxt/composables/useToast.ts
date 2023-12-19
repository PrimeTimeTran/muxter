// https://vue3-toastify.js-bridge.com/usage/positioning-toast.html

import { toast } from 'vue3-toastify'
import 'vue3-toastify/dist/index.css'
export const toastEm = (val: string, ...restArgs: any[]) => {
  let t = toast.TYPE.DEFAULT
  if (restArgs[1] === 'danger') {
    t = toast.TYPE.ERROR
  } else if (restArgs[1] === 'info') {
    t = toast.TYPE.INFO
  } else {
    t = toast.TYPE.SUCCESS
  }
  toast(val, {
    type: t,
    autoClose: restArgs[0] || 1500,
    position: toast.POSITION.BOTTOM_RIGHT,
  })
}
