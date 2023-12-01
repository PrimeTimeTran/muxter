import { toast } from 'vue3-toastify'
import 'vue3-toastify/dist/index.css'
export const toastEm = (val: string) => {
  toast(val, {
    autoClose: 1500,
    position: toast.POSITION.BOTTOM_RIGHT,
  })
}
