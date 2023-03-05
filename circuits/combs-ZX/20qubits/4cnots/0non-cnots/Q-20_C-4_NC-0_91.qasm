OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[19], q[17];
cx q[19], q[7];
cx q[7], q[17];
cx q[14], q[4];
