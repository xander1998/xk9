Vue.createApp({
  data() {
    return {
      showView: false,
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
    },
    CloseView() {
      this.showView = false;
      axios.post("http://xk9/close-view");
    }
  },
  components: { Kennel },
  mounted() {
    RegisterEvent("show-view", this.EVENT_ShowView);
    RegisterEvent("change-view", this.EVENT_ChangeView);
  },
}).mount("#app");