<script setup>
const props = defineProps(['state', 'text', 'icon', 'focused'])
</script>
<template>
  <button
    @click="emit('click')"
    class="btn btn-ghost flex text-black/75 dark:text-white hover:text-green-400 dark:hover:text-green-400"
    :class="{
      'text-green-400': focused,
      'justify-start': state.leftOpen,
      'hover:text-white': focused,
    }"
  >
    <span v-if="icon" class="h-6 w-6">
      <component :is="icon" />
    </span>
    <span v-text="text" v-if="state.leftOpen" />
  </button>
</template>
