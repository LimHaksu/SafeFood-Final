import {
    Doughnut,
    mixins
} from 'vue-chartjs'

export default {
    /* eslint-disable no-console */
    extends: Doughnut,
    props: [
        'chartData', 'options'
    ],
    mixins: [mixins.reactiveProp],
    mounted() {
        this.renderChart(this.chartData, this.options);
        console.log("마운트", this.chartData);
    },
    methods: {
        renderMyChart() {
            this.renderChart(this.chartData, this.options);
            console.log("렌더링");
        }
    },
    watch: {
        chartData: {
            handler() {
                this.renderMyChart();
            },
            deep: true
        }
    }
}