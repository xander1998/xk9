Vue.createApp({
  data() {
    return {
      showView: true,
      currentView: "kennel",
      dogs: []
    }
  },
  methods: {
    EVENT_ShowView(data) {
      this.showView = data.show;
    },
    EVENT_ChangeView(data) {
      this.currentView = data.view
    }
  },
  components: {},
  mounted() {
    RegisterEvent("show-view", this.EVENT_ShowView);
    RegisterEvent("change-view", this.EVENT_ChangeView);
  },
}).mount("#app");