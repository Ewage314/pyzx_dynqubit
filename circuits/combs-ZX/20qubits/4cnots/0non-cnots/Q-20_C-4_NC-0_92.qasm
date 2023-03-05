OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[11], q[1];
cx q[7], q[0];
cx q[5], q[17];
cx q[6], q[14];
