Vue.createApp({
  data() {
    return {
      dogHouseUiActive: false
    }
  },
  methods: {
    SelectK9(index) {
      console.log(index);
    },
    RetireK9(index) {
      console.log(index);
    }
  }
}).mount("#app");