Vue.createApp({
  data() {
    return {
      showView: false,
      currentView: "kennel"
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
      axios.post(`https://${GetParentResourceName()}/closeView`);
    }
  },
  components: { Kennel },
  mounted() {
    RegisterEvent("showView", this.EVENT_ShowView);
    RegisterEvent("changeView", this.EVENT_ChangeView);
  },
}).mount("#app");