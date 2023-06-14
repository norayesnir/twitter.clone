import { defineStore } from "pinia";

export const useAppearance = defineStore("appearance", {
  state: () => ({
    appearanceState: false,
    prefersDarkScheme: 'light',
  }),

  actions: {
    toggleAppearance() {
      this.appearanceState = !this.appearanceState;
      const rootElement = document.querySelector(':root');
      rootElement?.classList.toggle('dark-mode');
    },
  },
});
