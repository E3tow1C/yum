import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
    static targets = ["container", "checkbox", "cancelButton", "confirmAddCourses", "addCoursesToSchoolButton"]
    
    connect() {
        this.isInSelectMode = false
    }

    toggleCancelAndConfirmButtonVisibility() {
        console.log("isInSelectMode", this.isInSelectMode)
        if (this.isInSelectMode) {
            this.cancelButtonTarget.classList.add("hidden")
            this.confirmAddCoursesTarget.classList.add("hidden")
            this.addCoursesToSchoolButtonTarget.classList.remove("hidden")
            this.toggleContainerVisibility()
            this.isInSelectMode = false
        } else {
            this.cancelButtonTarget.classList.remove("hidden")
            this.confirmAddCoursesTarget.classList.remove("hidden")
            this.addCoursesToSchoolButtonTarget.classList.add("hidden")
            this.toggleContainerVisibility()
            this.isInSelectMode = true
        }
    }

    toggleContainerVisibility() {
        this.containerTargets.forEach((container) => {
            if (container.classList.contains("hidden")) {
                container.classList.remove("hidden")
                return;
            }

            container.classList.add("hidden")
            // also make checkbox unchecked
            this.checkboxTargets.forEach((checkbox) => {
                checkbox.checked = false
            })
        })
    }

    showSelectedCourses() {
        const selectedCheckboxes = this.checkboxTargets.filter(checkbox => checkbox.checked);
        const selectedCourseIds = selectedCheckboxes.map(checkbox => checkbox.value);
        
        console.log("Selected course IDs:", selectedCourseIds);
    
        if (selectedCourseIds.length > 0) {
            alert(`Selected courses: ${selectedCourseIds.join(', ')}`);
        } else {
            alert('No courses selected');
        }
    }
}