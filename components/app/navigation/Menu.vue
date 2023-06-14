<template>
  <div 
    class="navigation-menu"
    :class="{ 'navigation-menu__active': navigation.navigationState }"
  >
    <div class="navigation-logo">
      Twitter Clone
    </div>
    <div class="navigation-routes">
      <!-- <AppNavigationRoute /> -->
    </div>
    <div class="navigation-icons">
      <div class="navigation-appearance">
        <AppOptionsAppearance />
      </div>
      <AppNavigationHamburger/>
    </div>
  </div>
</template>

<script setup lang="ts">
import { useNavigationMenuStore } from "~/stores/navigationMenuStore"

const navigation = useNavigationMenuStore();
</script>

<style scoped lang="scss">
  .navigation-menu{    
    padding: 10px 16px;
    background-color: var(--background);
    border-bottom: solid 1px var(--secondary);

    display: grid;
    align-items: center;
    align-items: stretch;

    grid-template-columns: min-content 1fr min-content;
    grid-template-rows: 1fr;

    .navigation-logo{
      width: min-content;
      display: flex;
      justify-content: left;

      grid-area: 1 / 1;
    }

    .navigation-routes{
      position: relative;
      display: none;
      visibility: hidden;
      justify-content: right;
      height: min-content;
      margin-top: 64px;
      
      grid-row: 2;
      grid-column-start: 1;
      grid-column-end: 4;

      .navigation-image{
        display: none;
        visibility: hidden;
      }
    }

    .navigation-icons{
      display: flex;
      gap: 16px;
      justify-content: right;
      margin-left: 6px;
      
      grid-area: 1 / 3;
    }
  }

  .navigation-menu__active{
    grid-template-rows: min-content 1fr;
    height: 100%;

    .navigation-routes{
      display: flex;
      visibility: visible;
      justify-content: left;

      .routes{
        flex-direction: column;
        align-items: flex-start;
      }

      .navigation-image{
        display: inline-block !important;
        visibility: visible !important;
        position: fixed;
        bottom: -50px;
        left: -50px;
        max-height: 300px;
      }
    }
  }

  @media screen and (min-width: 550px) {
    .navigation-menu{
      grid-template-rows: 1fr;
      .navigation-logo{
        grid-area: 1;
      }

      .navigation-routes{
        display: flex;
        visibility: visible;
        grid-area: 1;
        margin-top: 0;
      }

      .navigation-appearance{
        grid-area: 1;
      }
    }
  }
</style>