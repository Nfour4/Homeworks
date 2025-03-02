document.addEventListener("DOMContentLoaded", () => {
    let openModal = document.querySelector("#openModal");
    let closeModal = document.querySelector("#closeModal");
    let modal = document.querySelector(".modal");

    if (openModal) {
        openModal.addEventListener("click", () => {
            modal.style.display = "block";
        });
    }
    if (closeModal) {
        closeModal.addEventListener("click", () => {
            modal.style.display = "none";
        });
    }
});
