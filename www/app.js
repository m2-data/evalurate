const btn = document.getElementById('buyReport');

const menuItem = document.getElementsByClassName('sidebar-menu')[0];
const report = document.getElementsByTagName('li');
const reportContent = document.getElementById('shiny-tab-report_nav');

const tabPane = document.getElementsByClassName('tab-pane')[1];

// console.log(tabPane);
let bool = false;

menuItem.children[1].style.display = "None";


btn.addEventListener('click', function(){
    menuItem.children[1].style.display = "Block";
    // reportContent.classList.add('active');
    // tabPane.classList.add('active');
    bool = true;
    // document.body.classList.remove('sidebar-collapse');
});