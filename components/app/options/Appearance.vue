<template>
  <div 
    @click="appearance.toggleAppearance"
    class="appearance"
  >
    <Icon v-if="!appearance.appearanceState"
      name="ic:outline-light-mode"
      size="24"
    />
    <Icon v-else
      name="ic:outline-dark-mode"
      size="24"
    />
  </div>
</template>

<script setup lang="ts">
import { useAppearance } from "~/stores/appereanceStore"

const appearance = useAppearance();
</script>

<style scoped lang="scss">
.icon{
  color: var(--foreground);
}
</style>