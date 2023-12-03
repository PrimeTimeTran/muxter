<template>
  <div>
    <NuxtLink
      class="cursor-pointer"
      href="/"
    >
      <img :src="imageSource" />
    </NuxtLink>
  </div>
</template>

<script setup>
import { useDark } from '@vueuse/core'
const imageSource = ref('https://i.imgur.com/EP68Vcc.png')
// const imageSource = ref('~/assets/images/logo-dark.png')
function setupRemote() {
  const isDark = useDark()
  watch(isDark, () => {
    initializeImageSource()
  })

  const initializeImageSource = () => {
    imageSource.value = isDark.value
      ? 'https://i.imgur.com/EP68Vcc.png'
      : 'https://i.imgur.com/0AtZKAM.png'
  }

  onMounted(() => {
    initializeImageSource()
  })

  return {
    imageSource,
  }
}
setupRemote()

function setupLocal() {
  const isDark = useDark()
  watch(isDark, () => {
    initializeImageSource()
  })

  const initializeImageSource = () => {
    imageSource.value = isDark.value
      ? '~/assets/images/logo-white.png'
      : '~/assets/images/logo-dark.png'
  }

  onMounted(() => {
    initializeImageSource()
  })

  return {
    imageSource,
  }
}
// setupLocal()
</script>
