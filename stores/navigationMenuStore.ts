import { defineStore } from "pinia";

export const useNavigationMenuStore = defineStore("navigationStore", {
  // Navigation Option(s)
  state: () => ({
    navigationState: false,
  }),

  actions: {
    toggleNavigation() {
      this.navigationState = (this.navigationState == true ? false : true)
    }
  },
});
