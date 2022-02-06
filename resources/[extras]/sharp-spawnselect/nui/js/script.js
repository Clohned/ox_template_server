function displayShowContent(element){
    if (element.classList.contains("selected")){
        element.classList.remove("selected")
        console.log("wow")
    }
    else {
        var curr_sel = document.querySelector('.content-container.selected');
        if (curr_sel) curr_sel.classList.remove('selected');
        element.classList.add("selected");
    }
}

function LastLocation(){
    $.post("http://sharp-spawnselect/LastLocation", JSON.stringify({}));
    $.post("http://sharp-spawnselect/SpawnPlayer", JSON.stringify({}));
    console.log("LastLocation")
    $("body").fadeOut(2200)
}

function SpawnTorget(){
    $.post("http://sharp-spawnselect/SpawnTorget", JSON.stringify({}));
    $.post("http://sharp-spawnselect/SpawnPlayer", JSON.stringify({}));
    console.log("SpawnTorget")
    $("body").fadeOut(2200)
}

function SpawnMRPD(){
    $.post("http://sharp-spawnselect/SpawnMRPD", JSON.stringify({}));
    $.post("http://sharp-spawnselect/SpawnPlayer", JSON.stringify({}));
    console.log("SpawnMRPD")
    $("body").fadeOut(2200)
}

function SpawnPink(){
    $.post("http://sharp-spawnselect/SpawnPink", JSON.stringify({}));
    $.post("http://sharp-spawnselect/SpawnPlayer", JSON.stringify({}));
    console.log("SpawnPink")
    $("body").fadeOut(2200)
}

function SpawnTrondheim(){
    $.post("http://sharp-spawnselect/SpawnTrondheim", JSON.stringify({}));
    $.post("http://sharp-spawnselect/SpawnPlayer", JSON.stringify({}));
    console.log("SpawnTrondheim")
    $("body").fadeOut(2200)
}

function SpawnTromso(){
    $.post("http://sharp-spawnselect/SpawnTromso", JSON.stringify({}));
    $.post("http://sharp-spawnselect/SpawnPlayer", JSON.stringify({}));
    console.log("SpawnTromso")
    $("body").fadeOut(2200)
}

function SpawnStrandmotel(){
    $.post("http://sharp-spawnselect/SpawnStrandmotel", JSON.stringify({}));
    $.post("http://sharp-spawnselect/SpawnPlayer", JSON.stringify({}));
    console.log("SpawnStrandmotel")
    $("body").fadeOut(2200)
}

function SpawnGardermoen(){
    $.post("http://sharp-spawnselect/SpawnGardermoen", JSON.stringify({}));
    $.post("http://sharp-spawnselect/SpawnPlayer", JSON.stringify({}));
    console.log("SpawnGardermoen")
    $("body").fadeOut(2200)
}


$(function () {
    window.addEventListener("message", function (passed) {
        var data = passed.data

        switch (data["Action"]) {
            case "OPEN_SPAWNMENU":
                $("body").fadeIn(0)
                break

            case "CLOSE_MENU":
                $("body").fadeOut(0)
                break
            default:
                console.log("Could not read message with action: " + data.Action)
                break
        }
    })
});