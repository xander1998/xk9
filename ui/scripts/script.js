Vue.createApp({
  data() {
    return {
      showView: true,
      currentView: "kennel",
      dogs: [
        { name: "Testing1", gender: "Male", color: "Brown", recruited: "0/0/0000", skills: [
          { skill: "Cocaine", level: 7, trained: "0/0/0000" },
          { skill: "Meth", level: 7, trained: "0/0/0000" },
          { skill: "Pills", level: 7, trained: "0/0/0000" },
          { skill: "Alcohol", level: 7, trained: "0/0/0000" }
        ] },
        { name: "Testing2", gender: "Male", color: "Black/White", recruited: "0/0/0000", skills: [
          { skill: "Cocaine", level: 7, trained: "0/0/0000" },
          { skill: "Meth", level: 7, trained: "0/0/0000" },
          { skill: "Pills", level: 7, trained: "0/0/0000" },
          { skill: "Alcohol", level: 7, trained: "0/0/0000" }
        ] },
        { name: "Testing3", gender: "Female", color: "Brown", recruited: "0/0/0000", skills: [
          { skill: "Cocaine", level: 7, trained: "0/0/0000" },
          { skill: "Meth", level: 7, trained: "0/0/0000" },
          { skill: "Pills", level: 7, trained: "0/0/0000" },
          { skill: "Alcohol", level: 0, trained: null }
        ] }
      ]
    }
  },
  methods: {
    EVENT_ShowView(data) {
      this.showView = data.state;
    },
    EVENT_ChangeView(data) {
      this.currentView = data.view;
    }
  },
  components: {
    Kennel
  },
  mounted() {
    RegisterEvent("show-view", this.EVENT_ShowView);
    RegisterEvent("change-view", this.EVENT_ChangeView);
  }
}).mount("#app");