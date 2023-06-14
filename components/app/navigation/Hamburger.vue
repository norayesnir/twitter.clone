<template>
  <div 
    @click="navigation.toggleNavigation"
    class="navigation-hamburger"
  >
    <Icon v-if="!navigation.navigationState"
      name="ic:outline-menu"
      size="24"
    />
    <Icon v-else
      name="ic:outline-close"
      size="24"
    />
  </div>
</template>

<script setup lang="ts">
import { useNavigationMenuStore } from "~/stores/navigationMenuStore"

const navigation = useNavigationMenuStore();
</script>

<style scoped lang="scss">
.icon{
  color: var(--foreground);
}

@media screen and (min-width: 550px) {
  .navigation-hamburger{
    display: none;
  }
}
</style>