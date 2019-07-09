const btn = document.getElementById('buyReport');

const menuItem = document.getElementsByClassName('sidebar-menu')[0];
const report = document.getElementsByTagName('li');
const contentEl = document.getElementsByClassName('content-wrapper')[0];
const sideBar = document.getElementsByClassName('main-sidebar')[0];
//const reportContent = document.getElementById('shiny-tab-report_nav');

//const tabPane = document.getElementsByClassName('tab-pane');
//const row = document.getElementsByClassName('row');

// console.log(tabPane);
let bool = true;  //after paypal purchase change bool to true to display report

menuItem.children[1].style.display = "None";

//const textBuy = document.createElement('p', 'The report is available to purchase via PayPal')

btn.addEventListener('click', function(event){
    if(bool == false){
        event.preventDefault();
    } else{
        menuItem.children[1].style.display = "Block";
        // contentEl.setAttribute('style', 'margin-left: 150px');
        // sideBar.setAttribute('style', 'width: 150px');
    }
    
    // menuItem.children[1].style.display = "Block";
    // reportContent.classList.add('active');
    // tabPane[1].classList.add('active');
    // bool = true;
    // document.body.classList.remove('sidebar-collapse');
});