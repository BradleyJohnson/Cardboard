// $(document).ready(function() {
//   var ctx = $("#myChart").get(0).getContext("2d");
//
//   var mechanics = [];
//   var wins = [];
//   var losses = [];
//
//   var results = JSON.parse($("div.hidden").html());
//   for (var i = 0; i < results.length; i++) {
//     mechanics.push(results[i].mechanic_type);
//     wins.push(parseInt(results[i].wins));
//     losses.push(parseInt(results[i].losses));
//   }
//
//   var data = {
//     labels: mechanics,
//     datasets: [
//                 {
//                     label: "Wins",
//                     fillColor: "rgba(236,196,54,0.5)",
//                     strokeColor: "rgba(236,196,54,0.5)",
//                     highlightFill: "rgba(236,196,54,0.5)",
//                     highlightStroke: "rgba(236,196,54,0.5)",
//                     data: wins
//                 },
//                 {
//                     label: "Losses",
//                     fillColor: "rgba(79, 79, 79, 0.5)",
//                     strokeColor: "rgba(79, 79, 79, 0.8)",
//                     highlightFill: "rgba(79, 79, 79, 0.75)",
//                     highlightStroke: "rgba(79, 79, 79, 1)",
//                     data: losses
//                 }
//               ]
//   };
//
//   var myBarChart = new Chart(ctx).Bar(data, {
//     scaleFontColor : "#ddd",
//     scaleFontSize: 12,
//     scaleShowVerticalLines: false,
//     scaleGridLineColor : "#ddd",
//   });
//
//
// });
