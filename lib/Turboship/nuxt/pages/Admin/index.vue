<template>
  <ContentDoc class="prose dark:prose-invert" />
</template>

<script setup>
import { useHead } from 'unhead'
useHead({
  script: [
    {
      innerHTML: 'console.log("Admin Index loading...")',
      tagPosition: 'head',
    },
  ],
})

definePageMeta({
  layout: 'admin-layout',
})
</script>
