    setInterval(() => {
      if (consumer.connection.connected == false) {
        consumer.connection.reopen();
      }