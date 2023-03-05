OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[14], q[18];
cx q[15], q[17];
cx q[14], q[17];
cx q[3], q[18];
