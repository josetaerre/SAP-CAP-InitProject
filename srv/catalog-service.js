module.exports = srv => {

  if (srv.name === 'CatalogService') {
    // srv.on('POST', 'Complaints', complaint => {
    srv.before('POST', 'Complaints', complaint => {
      console.log(complaint)
      let validStore = Boolean;
      // complaint.forEach(element => {
      //   if (element.store = '1000') {
      //     validStore = true
  //       } else {
  //         validStore = false
      //   }
      // });
  //     return validStore;
    })
  }

  // // console.log('Service name:', srv.name)
  // if (srv.name === 'CatalogService') {



    srv.after('READ', 'Complaints', complaint => {

      console.log(complaint);
  //     // option 1 start
  //     xs.map(x => x.stock > 500 && (x.title = `(5% off!) ${x.title}`))
  //     // option 1 end


  //     // option 2 start
  //     let newBooks = [];
  //     xs.forEach(x => {
  //       if (x.stock > 500) {
  //         x.title = '(5% off!) ' + x.title
  //       }
  //       newBooks.push(x)
  //     })
  //     return newBooks
  //     // option 2 end

    })


}