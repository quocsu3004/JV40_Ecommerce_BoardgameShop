<script>$(function () {
                    'use strict';
                    var nowTemp = new Date();
                    var now = new Date(nowTemp.getFullYear(), nowTemp.getMonth(), nowTemp.getDate(), 0, 0, 0, 0);

                    var checkin = $('#timeCheckIn').datepicker({
                        onRender: function (date) {
                            return date.valueOf();
                        }
                    }).on('changeDate', function (ev) {
                        if (ev.date.valueOf() > checkout.date.valueOf()) {
                            var newDate = new Date(ev.date);
                            newDate.setDate(newDate.getDate() + 2);
                            checkout.setValue(newDate);
                        }
                        checkin.hide();
                    }).data('datepicker');
                    var checkout = $('#timeCheckOut').datepicker({
                        onRender: function (date) {
                            return date.valueOf();
                        }
                    }).on('changeDate', function (ev) {
                        if (ev.date.valueOf() < checkin.date.valueOf()) {
                            var newDate = new Date(ev.date);
                            newDate.setDate(newDate.getDate() - 2);
                            checkin.setValue(newDate);
                        }
                        checkout.hide();
                    }).data('datepicker');
                });</script>