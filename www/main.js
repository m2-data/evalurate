const btn = document.getElementById('report');
let bool = false;

btn.addEventListener('click', function(){
    bool = true;
    console.log(bool);
    document.write('test');
    const newWin = window.open('ev_app_nochart.R');

    newWin.onload = function () {
        // `this`, in this context, makes reference to the new window object
        // You can use DOM methods, on the new document, with it.
        var myElem = this.document.getElementById('custom-header');
        console.log("Window object: ", this);
        console.log("Window's location: ", this.location.href);
        console.log("Id of element in new window: ", myElem.id);
        // Attach a click event to the new document's body
        this.document.body.onclick = function () {
            // `this`, inside of a listener, is the element itself
            // but this console.log will log inside of the parent window
            console.log(this);
            this.style.transition = 'all 1s';
            this.style.opacity = 0;
        };
        this.document.body.addEventListener('click', function () {
            // Now, let's log inside of the new window.
            // Since in here, this === this.document.body,
            // then you'll have to use the newWin var we set before.
            // newWin is the window object.
            newWin.console.log('Logging in new window!');
        });
    };
});

console.log(bool);
