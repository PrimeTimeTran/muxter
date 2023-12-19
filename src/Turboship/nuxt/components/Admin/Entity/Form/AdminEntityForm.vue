<script setup>
import _ from 'lodash'
import { DateTime } from 'luxon'

const props = defineProps(['entity', 'entityType'])
const items = ref([])

function setEntityFields() {
  try {
    let fields = []
    let entries = Object.entries(props.entity)
    let blackListed = ['_id', '__v', '']

    entries.forEach((e) => {
      if (!blackListed.includes(e[0])) {
        let item = {
          name: e[0],
          value: e[1],
          type: GlobalState.entities[props.entityType][e[0]]?.type,
        }
        fields.push(item)
      }
    })
    items.value = fields
  } catch (error) {
    console.log({
      error,
    })
  }
}
setEntityFields()
function toggleModal(id) {
  const modal = document.getElementById(`modal-${id}`)
  if (modal) {
    modal.showModal()
  }
}

async function submit(fields) {
  console.log({
    fields,
  })
}
function makeDate(val) {
  return DateTime.fromISO(val).toFormat('yyyy-MM-dd')
}
</script>
<template>
  <button class="btn btn-xs btn-ghost flex justify-start" @click="toggleModal(entity._id)">
    <FontAwesomeIcon class="mr-2 text-black dark:text-white" color="white" icon="fa-solid fa-pen-to-square" />
    Edit
  </button>
  <dialog :id="`modal-${entity._id}`" class="modal">
    <div class="modal-box w-11/12 max-w-7xl">
      <form method="dialog">
        <button @click="toggleModal(entity._id)" class="btn btn-sm btn-circle btn-ghost absolute right-2 top-2">
          ✕
        </button>
      </form>
      <h3 class="font-bold text-lg">Editing</h3>
      <div>
        <FormKit
          :id="`entityForm-${entity._id}`"
          type="form"
          @submit="submit"
          :actions="false"
          #default="{ value }"
          :classes="{
            help: 'dark:text-white',
            message: 'text-red-500 dark:text-red-300',
          }"
        >
          <div id="Foo" class="form-items-container grid grid-cols-4 gap-x-7 gap-y-7 px-3">
            <div v-for="field of items">
              <div class="item">
                <AdminEntityFormField
                  v-if="field.type != 'date'"
                  :help="''"
                  :type="field.type"
                  :name="field.name"
                  :value="field.value"
                  :entityType="entityType"
                  v-model="entity[field.name]"
                  :label="GlobalState.entities[entityType][field.name]?.label"
                  :options="GlobalState.entities[entityType][field.name]?.options"
                  :multiple="GlobalState.entities[entityType][field.name]?.type === 'enumeratorMulti'"
                />
                <AdminEntityFormField
                  v-else
                  :help="''"
                  :type="field.type"
                  :name="field.name"
                  :entityType="entityType"
                  :value="makeDate(entity[field.name])"
                  :v-model="makeDate(entity[field.name])"
                  :label="GlobalState.entities[entityType][field.name]?.label"
                  :options="GlobalState.entities[entityType][field.name]?.options"
                />
              </div>
            </div>
          </div>
          <button
            type="submit"
            label="submit"
            class="btn btn-success btn-block rounded justify-center my-2 p-4 text-white font-bold hover:shadow-lg"
          >
            Save
          </button>
        </FormKit>
      </div>
      <form method="dialog" class="modal-backdrop">
        <button @click="toggleModal(entity._id)">close</button>
      </form>
    </div>
    <form method="dialog" class="modal-backdrop">
      <button>close</button>
    </form>
  </dialog>
</template>
