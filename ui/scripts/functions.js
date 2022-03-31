function awaitResolveAfter(time) {
  return new Promise((resolve) => {
    setTimeout(() => {
      resolve();
    }, time);
  })
}