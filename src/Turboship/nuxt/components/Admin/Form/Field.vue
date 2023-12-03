<script setup>
const props = defineProps({
  min: { type: String },
  max: { type: String },
  type: { type: String },
  help: { type: String },
  name: { type: String },
  label: { type: String },
  options: { type: String },
  validation: { type: String },
  placeholder: { type: String },
  multiple: { type: Boolean, default: false },
})

const inputClasses =
  'min-w-full p-1 rounded border dark:bg-neutral-950 dark:text-white border dark:border-gray-700 bg-white'
const messageClasses = 'text-red-500 dark:text-red-300 absolute'
const outerClasses = 'flex flex-grow flex-col rounded'
const allClasses = {
  outer: outerClasses,
  input: inputClasses,
  label: 'dark:text-white',
  message: messageClasses,
}
</script>
<template>
  <FormKit
    v-if="type == 'text'"
    type="text"
    :name="name"
    :label="label"
    :classes="allClasses"
    :validation="validation"
    :placeholder="placeholder"
  />
  <FormKit
    v-else-if="type == 'boolean'"
    type="select"
    :name="name"
    :label="label"
    :placeholder="placeholder"
    :classes="allClasses"
    :options="options"
  />
  <FormKit
    v-else-if="type == 'select' && multiple"
    type="select"
    :name="name"
    :label="label"
    :multiple="multiple"
    :placeholder="placeholder"
    :classes="allClasses"
    :options="options"
  />
  <FormKit
    v-else-if="type == 'select' && !multiple"
    type="select"
    :name="name"
    :label="label"
    :multiple="multiple"
    :placeholder="placeholder"
    :classes="allClasses"
    :options="options"
  />
  <FormKit
    v-else-if="type == 'number'"
    :min="min"
    :max="max"
    type="number"
    :name="name"
    :label="label"
    :classes="allClasses"
    :placeholder="placeholder"
  />
  <FormKit
    v-else-if="type == 'date'"
    type="date"
    :help="help"
    :name="name"
    :label="label"
    :classes="allClasses"
    :validation="validation"
    :placeholder="placeholder"
  />
</template>
